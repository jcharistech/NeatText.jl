## The User Guide
The User Guide documentation begins with some background information about NeatText.jl, then focuses on step-by-step instructions for getting the most out of NeatText.jl.



## Getting Started

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

### Usage
NeatText.jl was made to be very simple to use just like the Python version `neattext`. However most of the usage is usually function/method oriented and not OOP like its Python counterpart.

#### Basic Usage

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

#### Using `clean_text` function for bulk cleaning
NeatText.jl offers a super function `clean_text` that allows you to do bulk cleaning of text using
predefined patterns. These patterns include the following
- [:emails,:urls,:mentions:hashtags,:userhandles,:htmltags:puncts,:numbers,:phonenumbers,:special_char]

More patterns can be included.
**Note** the predefined patterns follows an order and the order will influence how the text is cleaned.

```julia
>>> docx1 ="your text here with emails@gmail.com"
>>> NeatText.clean_text(docx1,usepatterns=[:emails,:puncts])
```
or

```julia
>>> using NeatText: clean_text
>>> clean_text(docx1,usepatterns=[:emails,:puncts])

```

#### Extracting Terms
With NeatText.jl, you can extract terms from a given terms based on either predefined patterns used for text cleaning or your own pattern.

```julia
>>> using NeatText
>>> NeatText.extract_urls(docx1)
>>> NeatText.extract_emails(docx1)
>>> NeatText.extract_hashtags(docx1)
>>> NeatText.extract_btc(docx1)
>>> NeatText.extract_stopwords(docx1)
```

#### Note:
NeatText.jl is also available for Python as `neattext` that operates basically the
same way.
