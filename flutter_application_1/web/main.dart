Iterable<String> thingsTodo() sync* {
  const actions = ['Walk', 'Wash', 'Feed'];
  const pets = ['cats', 'dogs'];

  for (final action in actions) {
    for (final pet in pets) {
      if (pet != 'cats' || action == 'Feed') {
        yield '$action the $pet';
      }
    }
  }
}

HTMLLIElement newLI(String itemText) =>
(document.createElement('li') as HTMLLIElement)..text = itemText;

 

void main(){
    final output = querySelector('#output');
 for (final item in thingsTodo()) {
   output?.appendChild(newLI(item));
 }
}