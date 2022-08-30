#* @get /epitweetr/top_words
#* @param cntry country name
#* @param num number of top words
#* @param tpc disease topics
function(tpc="", cntry="", num) { # the variable cntry get only one country name. it needs to be updated with a list
    epitweetr::setup_config("S:/Forschungsdaten/Zig/ZiG1/epit_trial_final")
    ob <- epitweetr::create_topwords(
        topic = tpc, 
        country_codes = cntry,
        date_min = "2022-08-01",
        date_max = "2022-08-30",
        with_retweets = FALSE, 
        location_type = "tweet", 
        top = num
    )
    print(ob)
    #print(country_codes)
}

#change the name into top_charts and put more than one param
#* @get /epitweetr/top_entities 
#* @param cntry country name
#* @param tpc disease name
function(tpc="") {
    epitweetr::setup_config("S:/Forschungsdaten/Zig/ZiG1/epit_trial_final")
    topchart <- epitweetr::create_topchart(
        topic= tpc,
        serie="entities",
        country_codes = c("LS"),
        date_min = "2022-08-01",
        date_max = "2022-08-31",
        with_retweets = FALSE,
        location_type = "tweet",
        top = 25
    )
    print(topchart)
}

#* @get /epitweetr/create_maps
#* @param tpc disease name
function(tpc="") {
    epitweetr::setup_config("S:/Forschungsdaten/Zig/ZiG1/epit_trial_final")
    map <- epitweetr::create_map(
        topic=tpc, 
        countries = "African Region",
        date_min = "2022-08-01",
        date_max = "2022-08-31",
        with_retweets = FALSE,
        location_type = "tweet"
    )
    print(map)
}

#* @get /epitweetr/trend_line
#* @param tpc disease name
function(tpc="") {
    epitweetr::setup_config("S:/Forschungsdaten/Zig/ZiG1/epit_trial_final")
    line <- epitweetr::trend_line(
        topic =tpc,
        countries = "African Region",
        date_type = "created_date",
        date_min = "2022-08-01",
        date_max = "2022-08-30",
        with_retweets = FALSE, 
        location_type = "tweet",
        alpha = 0.025,
        alpha_outlier = 0.05,
        k_decay= 4,
        no_historic=7
    )
    print(line)
}
