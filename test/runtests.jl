using Test
using NeatText


@testset "NeatText.jl" begin

    doc1 = """This is the mail example@gmail.com ,our WEBSITE is https://example.com 😊. This is visa 4111 1111 1111 1111 and bitcoin 1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2 with mastercard 5500 0000 0000 0004. Send it to PO Box 555, KNU"""
    doc2 = "he was saying <h2>hello</h2> but [Jane] said why that {word}"

    results_for_puncts = "This is the mail example gmail com  our WEBSITE is https   example com 😊  This is visa 4111 1111 1111 1111 and bitcoin 1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2 with mastercard 5500 0000 0000 0004  Send it to PO Box 555  KNU"
    results_for_emails = "This is the mail   ,our WEBSITE is https://example.com 😊. This is visa 4111 1111 1111 1111 and bitcoin 1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2 with mastercard 5500 0000 0000 0004. Send it to PO Box 555, KNU"
    results_for_numbers = "This is the mail example@gmail.com ,our WEBSITE is https://example.com 😊. This is visa         and bitcoin  BvBMSEYstWetqTFn Au m GFg xJaNVN  with mastercard        . Send it to PO Box  , KNU"
    results_for_mastercards = "This is the mail example@gmail.com ,our WEBSITE is https://example.com 😊. This is visa 4111 1111 1111 1111 and bitcoin 1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2 with mastercard  . Send it to PO Box 555, KNU"
    results_for_pobox = "This is the mail example@gmail.com ,our WEBSITE is https://example.com 😊. This is visa 4111 1111 1111 1111 and bitcoin 1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2 with mastercard 5500 0000 0000 0004. Send it to  , KNU"
    results_for_btc = "This is the mail example@gmail.com ,our WEBSITE is https://example.com 😊. This is visa 4111 1111 1111 1111 and bitcoin   with mastercard 5500 0000 0000 0004. Send it to PO Box 555, KNU"
    results_for_special_char = "This is the mail example gmail com  our WEBSITE is https example com   This is visa 4111 1111 1111 1111 and bitcoin 1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2 with mastercard 5500 0000 0000 0004  Send it to PO Box 555  KNU"
    results_for_cleantext = "This is the mail  our WEBSITE is  😊 This is visa 4111 1111 1111 1111 and bitcoin 1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2 with mastercard 5500 0000 0000 0004 Send it to PO Box 555 KNU"
    results_for_htmltags = "he was saying  hello  but [Jane] said why that {word}"
    results_for_brackets = "he was saying <h2>hello</h2> but [Jane] said why that "
    results_for_stopwords = "mail example@gmail.com ,our website https://example.com 😊. visa 4111 1111 1111 1111 bitcoin 1bvbmseystwetqtfn5au4m4gfg7xjanvn2 mastercard 5500 0000 0000 0004. send po box 555, knu"




    @test NeatText.remove_puncts(doc1) == results_for_puncts
    @test NeatText.remove_emails(doc1) ==  results_for_emails
    @test NeatText.remove_numbers(doc1) == results_for_numbers
    @test NeatText.remove_special_characters(doc1) == results_for_special_char
    @test NeatText.remove_mastercards(doc1) == results_for_mastercards
    @test NeatText.remove_pobox(doc1) == results_for_pobox
    @test NeatText.remove_btc(doc1) == results_for_btc
    @test NeatText.clean_text(doc1,usepatterns=[:emails,:urls,:puncts]) == results_for_cleantext
    @test NeatText.remove_htmltags(doc2) == results_for_htmltags
    @test NeatText.remove_terms_in_bracket(doc2) == results_for_brackets
    @test NeatText.remove_stopwords(doc1) == results_for_stopwords


end