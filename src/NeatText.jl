module NeatText

# Export for Removers
export remove_patterns,remove_stopwords,fix_contractions,remove_terms_in_bracket
export remove_puncts,remove_numbers,remove_phonenumbers,remove_currencies,remove_currency_symbols,remove_special_characters
export remove_emails,remove_urls,remove_hashtags,remove_htmltags,remove_userhandles,remove_emojis
export remove_md5sha,remove_btc,remove_pobox,remove_mastercards,remove_visacards,remove_streetaddress

# Export for Removers!(Mutating Fxns)
export remove_patterns!,remove_stopwords!,fix_contractions!,remove_terms_in_bracket!
export remove_puncts!,remove_numbers!,remove_phonenumbers!,remove_currencies!,remove_currency_symbols!,remove_special_characters!
export remove_emails!,remove_urls!,remove_hashtags!,remove_htmltags!,remove_userhandles!,remove_emojis!
export remove_md5sha!,remove_btc!,remove_pobox!,remove_mastercards!,remove_visacards!,remove_streetaddress!


# Export for Extractors
export extract_patterns,extract_stopwords
export extract_puncts,extract_numbers,extract_phonenumbers,extract_currencies,extract_dates
export extract_emails,extract_urls,extract_hashtags,extract_htmltags,extract_emojis,extract_userhandles
export extract_mastercards,extract_visacards,extract_creditcards,extract_md5sha,extract_pobox,extract_streetaddress
export extract_terms_in_bracket

# Export for Misc Functions
export clean_text!,clean_text

# Constants
const PUNCTS_REGEX = Regex("[!&'()*,-./:;?@[\\]^_`{|}]")
const EMAIL_REGEX =  r"[\w\.-]+@[\w\.-]+"
const NUMBERS_REGEX = r"\d+"
const PHONENUMBERS_REGEX = r"[\+\(]?[1-9][0-9 .\-\(\)]{8,}[0-9]"
const SPECIAL_CHARACTERS_REGEX = r"[^A-Za-z0-9 ]+"
const DATE_REGEX = r"([0-9]{2}\/[0-9]{2}\/[0-9]{4})|([0-9]{4}\/[0-9]{2}\/[0-9]{2})"

# modified for full stops, question marks, commas, colons and semi-colons, exclamation marks and quotation marks.
const MOST_COMMON_PUNCT_REGEX = Regex("""[!"&',-.;?_`]""")
const HTML_TAGS_REGEX = r"<[^<]+?>"
const CURRENCY_REGEX = r"[$¢£¤¥ƒ֏؋৲৳૱௹฿៛ℳ元円圆圓﷼\u20A0-\u20C0]\d+"
const CURRENCY_SYMB_REGEX = r"[$¢£¤¥ƒ֏؋৲৳૱௹฿៛ℳ元円圆圓﷼\u20A0-\u20C0]"
const HASHTAG_REGEX = r"#\S+"
const USER_HANDLES_REGEX = r"@\S+"
const STREET_ADDRESS_REGEX  = r"\d{1,4} [\w\s]{1,20}(?:street|st|avenue|ave|road|rd|highway|hwy|square|sq|trail|trl|drive|dr|court|ct|park|parkway|pkwy|circle|cir|boulevard|blvd)\W?`"
const PoBOX_REGEX  = r"(?i)P\.? ?O\.? Box \d+"
const ZIP_REGEX  = r"\b\d{5}(?:[-\s]\d{4})?\b"
const BTC_ADDRESS_REGEX = r"[13][a-km-zA-HJ-NP-Z1-9]{25,34}"
const CreditCard_REGEX = r"(?:(?:(?:\d{4}[- ]?){3}\d{4}|\d{15,16}))"
const VISACard_REGEX = r"4\d{3}[\s-]?\d{4}[\s-]?\d{4}[\s-]?\d{4}"
const MASTERCard_REGEX  = r"5[1-5]\d{2}[\s-]?\d{4}[\s-]?\d{4}[\s-]?\d{4}"
const MD5_SHA_REGEX = r"([0-9a-fA-F]{32})|([0-9a-fA-F]{40})|([0-9a-fA-F]{64})"
# const URL_REGEX= r"(?:^|(?<![\w\/\.]))|(?:(?:https?:\/\/|ftp:\/\/|www\d{0,3}\.))"
const URL_REGEX = r"http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+"

const EMOJI_REGEX = Regex("""[
                       u"\U0001F600-\U0001F64F"  # for emoticons
                       u"\U0001F300-\U0001F5FF"  # for symbols & pictographs
                       u"\U0001F680-\U0001F6FF"  # for transport & map symbols
                       u"\U0001F1E0-\U0001F1FF"  # for flags (iOS)
                       u"\U00002702-\U000027B0"
                       u"\U000024C2-\U0001F251"
                       "]+""",)

"""
remove_patterns: remove from given text your specified patterns

params:
	-text: text or string of text to be cleaned

"""
function remove_patterns(text::AbstractString,pattern::Regex)
	return replace(text,pattern=>" ")
end

"""
remove_puncts: Remove punctuations from a given text

params:
	-text: text or string of text to be cleaned

"""
function remove_puncts(text::AbstractString)
	return replace.(text,PUNCTS_REGEX=>" ")
end


"""
remove_special_characters: Remove Special Characters from a given text

params:
	-text: text or string of text to be cleaned

"""
function remove_special_characters(text::AbstractString)
	return replace.(text,SPECIAL_CHARACTERS_REGEX=>" ")
end


"""
remove_emails: Remove emails from a given text

params:
	-text: text or string of text to be cleaned

"""
function remove_emails(text::AbstractString)
	return replace.(text,EMAIL_REGEX=>" ")
end


"""
remove_emojis: Remove emojis from a given text

params:
	-text: text or string of text to be cleaned

"""
function remove_emojis(text::AbstractString)
	return replace.(text,EMOJI_REGEX=>" ")
end



"""
remove_numbers: Remove numbers from a given text

params:
	-text: text or string of text to be cleaned

"""
function remove_numbers(text::AbstractString)
	return replace.(text,NUMBERS_REGEX=>" ")
end


"""
remove_phonenumbers: Remove phonenumbers from a given text

params:
	-text: text or string of text to be cleaned

"""
function remove_phonenumbers(text::AbstractString)
	return replace.(text,PHONENUMBERS_REGEX=>" ")
end

"""
remove_htmltags: Remove htmltags from a given text

params:
	-text: text or string of text to be cleaned

"""
function remove_htmltags(text::AbstractString)
	return replace.(text,HTML_TAGS_REGEX=>" ")
end


"""
remove_urls: Remove URLS from a given text

params:
	-text: text or string of text to be cleaned

"""
function remove_urls(text::AbstractString)
	return replace.(text,URL_REGEX=>" ")
end

"""
remove_dates: Remove Dates from a given text

params:
	-text: text or string of text to be cleaned

"""
function remove_dates(text::AbstractString)
	return replace.(text,DATE_REGEX=>" ")
end


"""
remove_currencies: Remove currencies from a given text

params:
	-text: text or string of text to be cleaned

"""
function remove_currencies(text::AbstractString)
	return replace.(text,CURRENCY_REGEX=>" ")
end

"""
remove_currency_symbols: Remove currency symbols from a given text

params:
	-text: text or string of text to be cleaned

"""
function remove_currency_symbols(text::AbstractString)
	return replace.(text,CURRENCY_SYMB_REGEX=>" ")
end


"""
remove_userhandles: Remove userhandles or mentions from a given text

params:
	-text: text or string of text to be cleaned

"""
function remove_userhandles(text::AbstractString)
	return replace.(text,USER_HANDLES_REGEX=>" ")
end

"""
remove_hashtags: Remove hashtags symbols from a given text

params:
	-text: text or string of text to be cleaned

"""
function remove_hashtags(text::AbstractString)
	return replace.(text,HASHTAG_REGEX=>" ")
end


"""
remove_streetaddress: Remove street addresses from a given text

params:
	-text: text or string of text to be cleaned

"""
function remove_streetaddress(text::AbstractString)
	return replace.(text,STREET_ADDRESS_REGEX=>" ")
end

"""
remove_pobox: Remove Post Office Box Address from a given text

params:
	-text: text or string of text to be cleaned

"""
function remove_pobox(text::AbstractString)
	return replace.(text,PoBOX_REGEX=>" ")
end

"""
remove_btc: Remove BIT Address from a given text

params:
	-text: text or string of text to be cleaned

"""
function remove_btc(text::AbstractString)
	return replace.(text,BTC_ADDRESS_REGEX=>" ")
end



"""
remove_mastercard: Remove Master Card from a given text

params:
	-text: text or string of text to be cleaned

"""
function remove_mastercards(text::AbstractString)
	return replace.(text,MASTERCard_REGEX=>" ")
end

"""
remove_visacard: Remove Visa Card numbers from a given text

params:
	-text: text or string of text to be cleaned

"""
function remove_visacards(text::AbstractString)
	return replace.(text,VISACard_REGEX=>" ")
end


"""
remove_creditcards: Remove CreditCard numbers from a given text

params:
	-text: text or string of text to be cleaned

"""
function remove_creditcards(text::AbstractString)
	return replace.(text,CreditCard_REGEX=>" ")
end


"""
remove_md5sha: Remove MD5 and SHA values from a given text

params:
	-text: text or string of text to be cleaned

"""
function remove_md5sha(text::AbstractString)
	return replace.(text,MD5_SHA_REGEX =>" ")
end

"""
fix_contractions: fix contractions for a given text

"""
function fix_contractions(text::AbstractString)
	text = replace.(text,"ain't"=>"am not")
	text = replace.(text,"aren't"=>"are not")
	text = replace.(text,"can't"=>"cannot")
	text = replace.(text,"can't've"=>"cannot have")
	text = replace.(text,"'cause"=>"because")
	text = replace.(text,"could've"=>"could have")
	text = replace.(text,"couldn't"=>"could not")
	text = replace.(text,"couldn't've"=>"could not have")
	text = replace.(text,"didn't"=>"did not")
	text = replace.(text,"doesn't"=>"does not")
	text = replace.(text,"don't"=>"do not")
	text = replace.(text,"hadn't"=>"had not")
	text = replace.(text,"hadn't've"=>"had not have")
	text = replace.(text,"hasn't"=>"has not")
	text = replace.(text,"haven't"=>"have not")
	text = replace.(text,"he'd"=>"he would")
	text = replace.(text,"he'd've"=>"he would have")
	text = replace.(text,"he'll"=>"he will")
	text = replace.(text,"he'll've"=>"he will have")
	text = replace.(text,"he's"=>"he is")
	text = replace.(text,"how'd"=>"how did")
	text = replace.(text,"how'd'y"=>"how do you")
	text = replace.(text,"how'll"=>"how will")
	text = replace.(text,"how's"=>"how is")
	text = replace.(text,"I'd"=>"I would")
	text = replace.(text,"I'd've"=>"I would have")
	text = replace.(text,"I'll"=>"I will")
	text = replace.(text,"I'll've"=>"I will have")
	text = replace.(text,"I'm"=>"I am")
	text = replace.(text,"I've"=>"I have")
	text = replace.(text,"isn't"=>"is not")
	text = replace.(text,"it'd"=>"it had")
	text = replace.(text,"it'd've"=>"it would have")
	text = replace.(text,"it'll"=>"it will")
	text = replace.(text,"it'll've"=>"it will have")
	text = replace.(text,"it's"=>"it is")
	text = replace.(text,"let's"=>"let us")
	text = replace.(text,"ma'am"=>"madam")
	text = replace.(text,"mayn't"=>"may not")
	text = replace.(text,"might've"=>"might have")
	text = replace.(text,"mightn't"=>"might not")
	text = replace.(text,"mightn't've"=>"might not have")
	text = replace.(text,"must've"=>"must have")
	text = replace.(text,"mustn't"=>"must not")
	text = replace.(text,"mustn't've"=>"must not have")
	text = replace.(text,"needn't"=>"need not")
	text = replace.(text,"needn't've"=>"need not have")
	text = replace.(text,"o'clock"=>"of the clock")
	text = replace.(text,"oughtn't"=>"ought not")
	text = replace.(text,"oughtn't've"=>"ought not have")
	text = replace.(text,"shan't"=>"shall not")
	text = replace.(text,"sha'n't"=>"shall not")
	text = replace.(text,"shan't've"=>"shall not have")
	text = replace.(text,"she'd"=>"she would")
	text = replace.(text,"she'd've"=>"she would have")
	text = replace.(text,"she'll"=>"she will")
	text = replace.(text,"she'll've"=>"she will have")
	text = replace.(text,"she's"=>"she is")
	text = replace.(text,"should've"=>"should have")
	text = replace.(text,"shouldn't"=>"should not")
	text = replace.(text,"shouldn't've"=>"should not have")
	text = replace.(text,"so've"=>"so have")
	text = replace.(text,"so's"=>"so is")
	text = replace.(text,"that'd"=>"that would")
	text = replace.(text,"that'd've"=>"that would have")
	text = replace.(text,"that's"=>"that is")
	text = replace.(text,"there'd"=>"there had")
	text = replace.(text,"there'd've"=>"there would have")
	text = replace.(text,"there's"=>"there is")
	text = replace.(text,"they'd"=>"they would")
	text = replace.(text,"they'd've"=>"they would have")
	text = replace.(text,"they'll"=>"they will")
	text = replace.(text,"they'll've"=>"they will have")
	text = replace.(text,"they're"=>"they are")
	text = replace.(text,"they've"=>"they have")
	text = replace.(text,"to've"=>"to have")
	text = replace.(text,"wasn't"=>"was not")
	text = replace.(text,"we'd"=>"we had")
	text = replace.(text,"we'd've"=>"we would have")
	text = replace.(text,"we'll"=>"we will")
	text = replace.(text,"we'll've"=>"we will have")
	text = replace.(text,"we're"=>"we are")
	text = replace.(text,"we've"=>"we have")
	text = replace.(text,"weren't"=>"were not")
	text = replace.(text,"what'll"=>"what will")
	text = replace.(text,"what'll've"=>"what will have")
	text = replace.(text,"what're"=>"what are")
	text = replace.(text,"what's"=>"what is")
	text = replace.(text,"what've"=>"what have")
	text = replace.(text,"when's"=>"when is")
	text = replace.(text,"when've"=>"when have")
	text = replace.(text,"where'd"=>"where did")
	text = replace.(text,"where's"=>"where is")
	text = replace.(text,"where've"=>"where have")
	text = replace.(text,"who'll"=>"who will")
	text = replace.(text,"who'll've"=>"who will have")
	text = replace.(text,"who's"=>"who is")
	text = replace.(text,"who've"=>"who have")
	text = replace.(text,"why's"=>"why is")
	text = replace.(text,"why've"=>"why have")
	text = replace.(text,"will've"=>"will have")
	text = replace.(text,"won't"=>"will not")
	text = replace.(text,"won't've"=>"will not have")
	text = replace.(text,"would've"=>"would have")
	text = replace.(text,"wouldn't"=>"would not")
	text = replace.(text,"wouldn't've"=>"would not have")
	text = replace.(text,"y'all"=>"you all")
	text = replace.(text,"y'alls"=>"you alls")
	text = replace.(text,"y'all'd"=>"you all would")
	text = replace.(text,"y'all'd've"=>"you all would have")
	text = replace.(text,"y'all're"=>"you all are")
	text = replace.(text,"y'all've"=>"you all have")
	text = replace.(text,"you'd"=>"you had")
	text = replace.(text,"you'd've"=>"you would have")
	text = replace.(text,"you'll"=>"you you will")
	text = replace.(text,"you'll've"=>"you you will have")
	text = replace.(text,"you're"=>"you are")
	text = replace.(text,"you've"=>"you have")
	return text
end

"""Returns a string with terms/words in bracket together with the bracket removed
Params:
    - bracket_form: string or symbol about whether is it  curly({) or square([])
            or etc
"""

function remove_terms_in_bracket(text::AbstractString;bracket_form="curly")
        CURLY_BRACKET_REGEX = r"\{(.*?)\}" 
        SQUARE_BRACKET_REGEX = r"\[(.*?)\]" 
        NORMAL_BRACKET_REGEX = r"\((.*?)\)" 
        if (bracket_form == "curly") | (bracket_form == "{}")
            result = replace.(text,CURLY_BRACKET_REGEX=>"")
        elseif (bracket_form == "square") | (bracket_form == "[]")
            result = replace.(text,SQUARE_BRACKET_REGEX=>"")
        elseif (bracket_form == "normal") | (bracket_form == "()")
            result = replace.(text,NORMAL_BRACKET_REGEX=>"")
           end
        return result
end 


function count_char(s::AbstractString) 
  res = Dict{Char, Int}()
 for c in s
      if haskey(res, c)
         res[c] += 1
      else
         res[c] = 1
      end
   end
   return res
end



# A Dictionary of Regular Expressions
const REGEX_DICT = Dict(
	:puncts => PUNCTS_REGEX,
	:special_char => SPECIAL_CHARACTERS_REGEX,
	:userhandles => USER_HANDLES_REGEX,
	:emails => EMAIL_REGEX,
	:numbers => NUMBERS_REGEX,
	:phonenumbers => PHONENUMBERS_REGEX,
	:mentions => r"@\w+",
	:hashtags => r"#\w+",
	:urls => r"http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+",
	:htmltags => HTML_TAGS_REGEX
);



"""
clean_text: Clean A Given Text using a set of patterns

usepatterns: An array or collection of predefined pattern symbols
	- [:emails,:urls,:mentions:hashtags,:userhandles,:htmltags:puncts,:numbers,:phonenumbers,:special_char]

   [:emails
	:urls
	:mentions
	:hashtags
	:userhandles
	:htmltags
	:puncts
	:numbers
	:phonenumbers
	:special_char]

note:
----
	- the order of the patterns matters in how the text is cleaned
"""
function clean_text(text::AbstractString;usepatterns::Array)
	for p in usepatterns
		text = replace.(text,REGEX_DICT[p]=> "")
	end
	return text
end 


include("stopwordlist.jl")

"""
remove_stopwords: returns a text with all stopwords in the given text removed
param:
-----
 - lang: specify the language for the stopwords : en,es,fr,ru,yo,de

params:
	-text: text or string of text to be cleaned

"""
function remove_stopwords(text::AbstractString,lang="en")
	if lang == "en"
		stopwords_in_use = STOPWORDS_en
    elseif lang == "es"
    	stopwords_in_use = STOPWORDS_es
    elseif lang == "fr"
    	stopwords_in_use = STOPWORDS_fr
    elseif lang == "ru"
    	stopwords_in_use = STOPWORDS_ru
    elseif lang == "yo"
    	stopwords_in_use = STOPWORDS_yo
    elseif lang == "de"
    	stopwords_in_use = STOPWORDS_de
    else
    	stopwords_in_use = STOPWORDS_en
    end

	alltokens = []
	for w in split(lowercase(text)," ")
		if w ∉ stopwords_in_use
			push!(alltokens,w)
		end
	end 
	return join(alltokens," ")

end

# Extractors
include("textExtractors.jl")



end # module
