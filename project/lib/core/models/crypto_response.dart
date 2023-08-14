import 'dart:convert';

List<CryptoResponse> getCryptoPriceListFromJson(String str) =>
    List<CryptoResponse>.from(
        json.decode(str).map((x) => CryptoResponse.fromJson(x)));

class CryptoResponse {
  String? id;
  String? symbol;
  String? name;
  String? image;
  double? currentPrice;
  double? marketCap;
  double? marketCapRank;
  double? fullyDilutedValuation;
  double? totalVolume;
  double? high24h;
  double? low24h;
  double? priceChange24h;
  double? priceChangePercentage24h;
  double? marketCapChange24h;
  double? marketCapChangePercentage24h;
  double? circulatingSupply;
  double? totalSupply;
  double? maxSupply;
  double? ath;
  double? athChangePercentage;
  String? athDate;
  double? atl;
  double? atlChangePercentage;
  String? atlDate;
  Null? roi;
  String? lastUpdated;

  CryptoResponse(
      {this.id,
        this.symbol,
        this.name,
        this.image,
        this.currentPrice,
        this.marketCap,
        this.marketCapRank,
        this.fullyDilutedValuation,
        this.totalVolume,
        this.high24h,
        this.low24h,
        this.priceChange24h,
        this.priceChangePercentage24h,
        this.marketCapChange24h,
        this.marketCapChangePercentage24h,
        this.circulatingSupply,
        this.totalSupply,
        this.maxSupply,
        this.ath,
        this.athChangePercentage,
        this.athDate,
        this.atl,
        this.atlChangePercentage,
        this.atlDate,
        this.roi,
        this.lastUpdated});

  CryptoResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'];
    image = json['image'];
    currentPrice = double.parse('${json['current_price'] ?? 0}');
    marketCap = double.parse('${json['market_cap']??0}');
    marketCapRank = double.parse('${json['market_cap_rank']??0}');
    fullyDilutedValuation = double.parse('${json['fully_diluted_valuation']??0}');
    totalVolume = double.parse('${json['total_volume']??0}');
    high24h = double.parse('${json['high_24h']??0}');
    low24h = double.parse('${json['low_24h']??0}');
    priceChange24h = json['price_change_24h'];
    priceChangePercentage24h = json['price_change_percentage_24h'];
    marketCapChange24h = double.parse('${json['market_cap_change_24h']??0}');
    marketCapChangePercentage24h = json['market_cap_change_percentage_24h'];
    circulatingSupply = double.parse('${json['circulating_supply']??0}');
    totalSupply = double.parse('${json['total_supply']??0}');
    maxSupply = double.parse('${json['max_supply']??0}');
    ath = double.parse('${json['ath']??"0"}');
    athChangePercentage = json['ath_change_percentage'];
    athDate = json['ath_date'];
    atl = json['atl'];
    atlChangePercentage = json['atl_change_percentage'];
    atlDate = json['atl_date'];
    roi = json['roi'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['image'] = this.image;
    data['current_price'] = this.currentPrice;
    data['market_cap'] = this.marketCap;
    data['market_cap_rank'] = this.marketCapRank;
    data['fully_diluted_valuation'] = this.fullyDilutedValuation;
    data['total_volume'] = this.totalVolume;
    data['high_24h'] = this.high24h;
    data['low_24h'] = this.low24h;
    data['price_change_24h'] = this.priceChange24h;
    data['price_change_percentage_24h'] = this.priceChangePercentage24h;
    data['market_cap_change_24h'] = this.marketCapChange24h;
    data['market_cap_change_percentage_24h'] =
        this.marketCapChangePercentage24h;
    data['circulating_supply'] = this.circulatingSupply;
    data['total_supply'] = this.totalSupply;
    data['max_supply'] = this.maxSupply;
    data['ath'] = this.ath;
    data['ath_change_percentage'] = this.athChangePercentage;
    data['ath_date'] = this.athDate;
    data['atl'] = this.atl;
    data['atl_change_percentage'] = this.atlChangePercentage;
    data['atl_date'] = this.atlDate;
    data['roi'] = this.roi;
    data['last_updated'] = this.lastUpdated;
    return data;
  }
}
