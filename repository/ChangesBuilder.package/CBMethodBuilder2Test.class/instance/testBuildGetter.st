tests
testBuildGetter
	builder selector: 'item'.
	builder addComment: 'hello'.
	builder addPragma: (Pragma keyword: #generated arguments: {}).
	self
		assertMethod: builder buildGetter
		equals:
			'item
	"hello"
	<generated>
	^ item'