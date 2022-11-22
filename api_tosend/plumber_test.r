#* @get /epitweetr/top_words
#* @serializer json
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
    mydata <- topwords$data
    #mydata <- as.data.frame(topwords$data) #type: list 
    #mydata <- jsonlite::toJSON(topwords$data) #type: character
    print(mydata)
}
