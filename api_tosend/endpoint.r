#* @post /epitweetr/top_words
#* @serializer json list(na='string')
#* @param cntry country name
#* @param num number of top words
#* @param tpc disease topics
function(tpc="") { 
    epitweetr::setup_config("DATA_PATH")
    topwords <- epitweetr::create_topwords(
        topic = tpc, 
        country_codes = c("LS"),
        date_min = "2022-08-01",
        date_max = "2022-08-30",
        with_retweets = FALSE, 
        location_type = "tweet", 
        top = 25
    )
    print(topwords)
}

#change the name into top_charts and put more than one param
#* @post /epitweetr/top_entities 
#* @param cntry country name
#* @param tpc disease name
function(tpc="") {
    epitweetr::setup_config("DATA_PATH")
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
    epitweetr::setup_config("DATA_PATH")
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
    epitweetr::setup_config("DATA_PATH")
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