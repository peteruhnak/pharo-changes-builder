tests
testWithPragma
	builder addPragma: (Pragma keyword: #generated arguments: {}).
	builder addPragma: (Pragma keyword: #hello:world: arguments: (Array with: 'a' with: 'b')).
	self
		assert: builder buildPragmas
		equals:
			'<generated>
	<hello: ''a'' world: ''b''>'