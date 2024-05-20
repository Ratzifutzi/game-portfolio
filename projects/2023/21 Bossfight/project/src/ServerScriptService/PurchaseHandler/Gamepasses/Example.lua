local module = {}

module.gamepassId = 0000000

module.purchased = function(receiptInfo)
	print(receiptInfo)
end

module.test = function(receiptInfo)
	return "No test specified. A test is highly recommended. You must return true if your test was successful. Anything else will fail the test"
end

return module
