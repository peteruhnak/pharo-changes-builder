strategies
useMustache
	self
		templateStrategy: [ :aTemplate :aContext | (MustacheTemplate on: aTemplate) value: aContext asDictionary ]