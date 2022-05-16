#' Misinformation-Exposure Score Function
#' This function calculates the a misinformation exposure score based on Twitter account that a user follows
#' @name get_misinfo_exposure_score
#' @param user_id or screen_name of users for whom you want to calculate the scores
#' @return users and their misinformation-exposure scores
#' @export

data(falsity.scores)


get_misinfo_exposure_score <- function(users){
  friends <- rtweet::get_friends(users,verbose = TRUE)
  friends_score <- merge(x=friends,y=falsity_score,by.x="user_id",by.y='elite_id_str',all.x=TRUE, retryonratelimit = TRUE)
  friends_score$falsity_score_weighted <- friends_score$falsity_score * friends_score$elite_weight
  r <- aggregate(friends_score$falsity_score_weighted,by=list(friends_score$user),FUN=mean,na.rm=TRUE,na.action=NULL)
  colnames(r) <- c('user','misinfo_score')
  return(r)
}


get_misinfo_exposure_score(c('dg_rand'))
