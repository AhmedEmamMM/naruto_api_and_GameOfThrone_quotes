import '../models/got_quote.dart';
import '../web%20services/got_quote_web_services.dart';

class GOTrepo {
  final GOTwebServices goTwebServices;
  GOTrepo(this.goTwebServices);

  Future<List<GOTquote>> getRandomQuotes() async {
    var randomQuotes = await goTwebServices.getRandomQuotes();
    return randomQuotes.map((quote) => GOTquote.fromJson(quote)).toList();
  }
}
