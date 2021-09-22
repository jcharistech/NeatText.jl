### Extract Terms

"""
extract_patterns: Extract Patterns from Text
```julia
extract_patterns(s,:puncts)

```
"""
function extract_patterns(text::AbstractString, pattern)
        return collect(x.match for x in eachmatch(REGEX_DICT[pattern], text))
end

"""
extract_numbers: Extract all numbers from a given text
"""
function extract_numbers(text::AbstractString)
        res = [m.match for m in eachmatch(NUMBERS_REGEX,text)]
        return res
    end


"""
extract_phonenumbers: Extract all phone numbers from a given text
"""
function extract_phonenumbers(text::AbstractString)
        res = [m.match for m in eachmatch(PHONENUMBERS_REGEX,text)]
        return res
    end


"""
extract_currencies: Extract all currencies from a given text
"""
function extract_currencies(text::AbstractString)
        res = [m.match for m in eachmatch(CURRENCY_REGEX,text)]
        return res
    end


"""
extract_btc: Extract all Bitcoin BTC Address/Values from a given text
"""
function extract_btc(text::AbstractString)
        res = [m.match for m in eachmatch(BTC_ADDRESS_REGEX,text)]
        return res
    end


"""
extract_mastercards: Extract all MasterCard Address/Values from a given text
"""
function extract_mastercards(text::AbstractString)
        res = [m.match for m in eachmatch(MASTERCard_REGEX,text)]
        return res
    end

"""
extract_visacards: Extract all VisaCards Address/Values from a given text
"""
function extract_visacards(text::AbstractString)
        res = [m.match for m in eachmatch(VISACard_REGEX,text)]
        return res
    end



"""
extract_emails: Extract all emails from a given text
"""
function extract_emails(text::AbstractString)
        res = [m.match for m in eachmatch(EMAIL_REGEX,text)]
        return res
    end


"""
extract_urls: Extract all urls from a given text
"""
function extract_urls(text::AbstractString)
        res = [m.match for m in eachmatch(URL_REGEX,text)]
        return res
    end


"""
extract_puncts: Extract all punctuations from a given text
"""
function extract_puncts(text::AbstractString)
        res = [m.match for m in eachmatch(PUNCTS_REGEX,text)]
        return res
    end


"""
extract_special_characters: Extract all special characters from a given text
"""
function extract_special_characters(text::AbstractString)
        res = [m.match for m in eachmatch(SPECIAL_CHARACTERS_REGEX,text)]
        return res
    end

"""
extract_emojis: Extract all emojis from a given text
"""
function extract_emojis(text::AbstractString)
        res = [m.match for m in eachmatch(EMOJI_REGEX,text)]
        return res
    end


"""
extract_userhandles: Extract all userhandles and mentions from a given text
"""
function extract_userhandles(text::AbstractString)
        res = [m.match for m in eachmatch(USER_HANDLES_REGEX,text)]
        return res
    end


"""
extract_hashtags: Extract all hashtags from a given text
"""
function extract_hashtags(text::AbstractString)
        res = [m.match for m in eachmatch(HASHTAG_REGEX,text)]
        return res
    end



"""
extract_userhandles: Extract all dates from a given text
"""
function extract_dates(text::AbstractString)
        res = [m.match for m in eachmatch(DATE_REGEX,text)]
        return res
    end


"""
extract_pobox: Extract all Post Office Box from a given text
"""
function extract_pobox(text::AbstractString)
        res = [m.match for m in eachmatch(PoBOX_REGEX,text)]
        return res
    end


"""
extract_streetaddress: Extract all Street Address from a given text
"""
function extract_streetaddress(text::AbstractString)
        res = [m.match for m in eachmatch(STREET_ADDRESS_REGEX,text)]
        return res
    end


"""
extract_md5sha: Extract all MD5 or SHA Hashes from a given text
"""
function extract_md5sha(text::AbstractString)
        res = [m.match for m in eachmatch(MD5_SHA_REGEX,text)]
        return res
    end

# returns RegexMatch Type
# function extract_numbers(s::AbstractString)
#            res = eachmatch(r"\d+",s)
#            return collect(res)
# end


function extract_terms_in_bracket(text::AbstractString;bracket_form="curly")
        CURLY_BRACKET_REGEX = r"\{(.*?)\}" 
        SQUARE_BRACKET_REGEX = r"\[(.*?)\]" 
        NORMAL_BRACKET_REGEX = r"\((.*?)\)" 
        if (bracket_form == "curly") | (bracket_form == "{}")
            result = [m.match for m in eachmatch(CURLY_BRACKET_REGEX,text)]
        elseif (bracket_form == "square") | (bracket_form == "[]")
            result = [m.match for m in eachmatch(SQUARE_BRACKET_REGEX,text)]
        elseif (bracket_form == "normal") | (bracket_form == "()")
            result = [m.match for m in eachmatch(NORMAL_BRACKET_REGEX,text)]
           end
        return result
end 



"""
extract_stopwords: returns a list of stopwords in the given text
param:
-----
 - lang: specify the language for the stopwords : en,es,fr,ru,yo,de
"""
function extract_stopwords(text::AbstractString,lang="en")
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
                if w in stopwords_in_use
                        push!(alltokens,w)
                end
        end 
        return Set(alltokens)

end