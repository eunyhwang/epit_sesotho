#* @get /epitweetr/top_words
#* @param cntry country name
#* @param num number of top words
function(cntry="") {
    epitweetr::setup_config("S:/Forschungsdaten/Zig/ZiG1/epit_trial_final")
    ob <- epitweetr::create_topwords(
        topic = "COVID-19", 
        country_codes = cntry,
        date_min = "2022-08-30",
        date_max = "2022-08-30",
        with_retweets = FALSE, 
        location_type = "tweet", 
        top = 25
    )
    print(ob)
    print(country_codes)
}
