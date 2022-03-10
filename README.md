# NeatText.jl
A Simple Text Cleaning Package For NLP Task in Julia Language
It is a port of the `NeatText` python package for text cleaning and NLP task,you can check it out [here](https://jcharis.github.io/neattext/).
NeatText.jl offers some main features for text cleaning. These include;
+ removing terms,noisy data or unwanted text 
+ extracting terms,noisy data or unwanted text 
+ general functions


### Installation
+ From Julia Package Registry
```julia-repl
] add NeatText

```
or 
```julia
using Pkg
Pkg.add("NeatText")

```

+ You can also clone this repository and work with it.
or 
```julia-repl
] add github.com/jcharistech/NeatText.jl

```
You can check out the full docs [here](https://jcharistech.github.io/NeatText.jl/)

### Basic Usage
```julia
>>> using NeatText
>>> docx1 = "your text here"
>>>
>>> NeatText.remove_puncts(docx1)
>>> NeatText.remove_urls(docx1)
>>> NeatText.remove_emails(docx1)
>>> NeatText.remove_special_characters(docx1)
>>> NeatText.remove_stopwords(docx1)
>>> NeatText.remove_btc(docx1)
>>> NeatText.remove_pobox(docx1)
>>> NeatText.remove_hashtags(docx1)
>>> NeatText.remove_htmltags(docx1)
>>> NeatText.remove_terms_in_bracket(docx1,bracket_form="curly")
```

### Using `clean_text` function for bulk cleaning
NeatText.jl offers a super function `clean_text` that allows you to do bulk cleaning of text using
predefined patterns as symbols. These patterns include the following
- [:emails,:urls,:mentions:hashtags,:userhandles,:htmltags:puncts,:numbers,:phonenumbers,:special_char]

More patterns can be included.
**Note** The predefined patterns follows an order and the order will influence how the text is cleaned.

```julia
>>> docx1 ="your text here with emails@gmail.com"
>>> NeatText.clean_text(docx1,usepatterns=[:emails,:puncts])
```
or

```julia
>>> using NeatText: clean_text
>>> clean_text(docx1,usepatterns=[:emails,:puncts])

```

### Extracting Terms
With NeatText.jl, you can extract terms from a given terms based on either predefined patterns used for text cleaning or your own pattern.

```julia
>>> using NeatText
>>> NeatText.extract_urls(docx1)
>>> NeatText.extract_emails(docx1)
>>> NeatText.extract_hashtags(docx1)
>>> NeatText.extract_btc(docx1)
>>> NeatText.extract_stopwords(docx1)
```




### List of Available Functions
+ To get all the available functions you can use
```julia
println(names(NeatText))
```
```julia-repl
[:NeatText, :clean_text, :extract_creditcards, :extract_currencies, :extract_dates, :extract_emails, :extract_emojis, :extract_hashtags, :extract_htmltags, :extract_mastercards, :extract_md5sha, :extract_numbers, :extract_patterns, :extract_phonenumbers, :extract_pobox, :extract_puncts, :extract_streetaddress, :extract_terms_in_bracket, :extract_urls, :extract_userhandles, :extract_visacards, :fix_contractions, :remove_btc, :remove_currencies, :remove_currency_symbols, :remove_emails, :remove_emojis, :remove_hashtags, :remove_htmltags, :remove_mastercards, :remove_md5sha, :remove_numbers, :remove_patterns, :remove_phonenumbers, :remove_pobox, :remove_puncts, :remove_special_characters, :remove_streetaddress, :remove_terms_in_bracket, :remove_urls, :remove_userhandles, :remove_visacards]


```




