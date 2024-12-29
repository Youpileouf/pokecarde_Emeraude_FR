#!/usr/bin/env python2.7
asmProblemBytes = ['\x00', '\x09', '\x0A', '\x22']
def asmQuote(t):
	result = ""
	quoted = False
	if t[0] in asmProblemBytes:
		result = '{0}'.format(ord(t[0]))
	else:
		result = '"' + t[0]
		quoted = True
	t = t[1:]

	while len(t):
		if quoted and t[0] in asmProblemBytes:
			result += '",{0}'.format(ord(t[0]))
			quoted = False
		elif quoted:
			result += t[0]
		elif t[0] in asmProblemBytes:
			result += ',{0}'.format(ord(t[0]))
			quoted = False
		else:
			result += ',"' + t[0]
			quoted = True
		t = t[1:]
	if quoted:
		result += '"'
	return result

def asmQuoteBytes(t):
	og_q = asmQuote(t)
	og_b = ""
	for b in og_q.replace('",0,"', '\x00').replace('"', '').replace(',0', '\x00'):
		og_b += hex(ord(b))

	result = ""
	test = ""
	for b in t:
		result += '{0}'.format(ord(b)) + ","
		test += hex(ord(b))

	result = result[:-1]

	if og_b != test:
		print("WARN:", og_q, og_b, test)

	return result
