source(output(
		order_id as string,
		order_date as string,
		customer_id as string,
		product as string,
		category as string,
		quantity as string,
		unit_price as string,
		{Total Amount} as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	ignoreNoFilesFound: false) ~> RawSales
RawSales derive(order_id = iif(isNull(order_id) , toInteger(-1) , toInteger(order_id))) ~> orderid
orderid derive(order_date = iif(isNull(order_date), 'Null' , order_date)) ~> orderdate
orderdate derive(customer_id = iif(isNull(customer_id) , 'Null' , upper(customer_id))) ~> customerid
customerid derive(product = iif(isNull(product), 'Null', product)) ~> product
product derive(category = iif(isNull(category) , 'Electronics' , 'Electronics')) ~> category
category derive(quantity = iif(isNull(quantity) , toInteger(0) , abs(toInteger(quantity)))) ~> quantity
quantity derive(unit_price = iif(isNull(unit_price) , toInteger(0) , abs(toInteger(unit_price)))) ~> unitprice
unitprice derive({Total Amount} = iif(isNull({Total Amount}) , toInteger(0) , abs(toInteger({Total Amount})))) ~> TotalAmount
TotalAmount sink(allowSchemaDrift: true,
	validateSchema: false,
	input(
		order_id as string,
		order_date as string,
		customer_id as string,
		product as string,
		category as string,
		quantity as string,
		unit_price as string,
		{Total Amount} as string
	),
	umask: 0022,
	preCommands: [],
	postCommands: [],
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true) ~> Saleshandled