exchange_info = [
	{
		id: 1,
    name: "coincheck",
    url: "https://coincheck.com/"
	},
  {
    id: 2,
    name: "bitbank",
    url: "https://bitbank.cc/"
  },
  {
    id: 3,
    name: "bitFlyer",
    url: "https://bitflyer.jp/"
  },
  {
    id: 4,
    name: "Zaif",
    url: "https://zaif.jp/"
  },
  {
    id: 5,
    name: "BtcBox",
    url: "https://www.btcbox.co.jp/"
  },
  {
    id: 6,
    name: "FISCO",
    url: "https://fcce.jp/"
  }
]

if Exchange.count == 0
  exchange_info.each do |ex|
    Exchange.create(ex)
  end
end