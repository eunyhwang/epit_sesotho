#* @get /epitweetr/top_words
#* @serializer png
#* @param cntry country name
#* @param num number of top words
#* @param tpc topic to query
#* @param start indicating start of the reporting period
#* @param end indicating end of the reporting period
function(tpc="", cntry="", num="", start="", end="") { 
    epitweetr::setup_config(data_path)
    topwords <- epitweetr::create_topwords(
        topic = tpc,
        country_codes = cntry,
        date_min = start,
        date_max = end,
        with_retweets = FALSE, 
        location_type = "tweet", 
        top = num
    )
    plot(topwords$chart)
}

#* @get /epitweetr/top_entities
#* @serializer png
#* @param cntry country name
#* @param num number of top words
#* @param tpc topic to query
#* @param start indicating start of the reporting period
#* @param end indicating end of the reporting period
function(tpc="", cntry="", num="", start="", end="") { 
    epitweetr::setup_config(data_path)
    topchart <- epitweetr::create_topchart(
        topic = tpc,
        serie="entities",
        country_codes = cntry,
        date_min = start,
        date_max = end,
        with_retweets = FALSE, 
        location_type = "tweet", 
        top = num
    )
    plot(topchart$chart)
}

#* @get /epitweetr/create_maps
#* @serializer png
#* @param cntry country name # names hould be in a full name (e.g. Lesotho)
#* @param tpc topic to query
#* @param start indicating start of the reporting period
#* @param end indicating end of the reporting period
function(tpc="", cntry="", start="", end="") { 
    epitweetr::setup_config(data_path)
    map <- epitweetr::create_map(
        topic = tpc,
        countries = cntry,
        date_min = start,
        date_max = end,
        with_retweets = FALSE, 
        location_type = "tweet", 
    )
    plot(map$chart)
}

#* @get /epitweetr/trend_line
#* @serializer png
#* @param cntry country name
#* @param tpc topic to query
#* @param start indicating start of the reporting period
#* @param end indicating end of the reporting period
function(tpc="", cntry="" , start="", end="") { 
    epitweetr::setup_config(data_path)
    trendline <- epitweetr::trend_line(
        topic = tpc,
        countries = cntry,
        date_min = start,
        date_max = end,
    )
    plot(trendline$chart)
}
