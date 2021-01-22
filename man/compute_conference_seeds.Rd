% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compute_conference_seeds.R
\name{compute_conference_seeds}
\alias{compute_conference_seeds}
\title{Compute NFL Playoff Seedings using Game Results and Divisional Rankings}
\usage{
compute_conference_seeds(
  teams,
  h2h = NULL,
  tiebreaker_depth = 3,
  .debug = FALSE,
  playoff_seeds = 7
)
}
\arguments{
\item{teams}{The division standings data frame as computed by
\code{\link{compute_division_ranks}}}

\item{h2h}{A data frame that is used for head-to-head tiebreakers across the
tiebreaking functions. It is computed by the function
\code{\link{compute_division_ranks}}.}

\item{tiebreaker_depth}{A single numeric value in the range of 1, 2, 3. The
value controls the depth of tiebreakers that shall be applied. The deepest
currently implemented tiebreaker is strength of schedule. The following
values are valid:
\describe{
\item{tiebreaker_depth = 1}{Break all ties with a coinflip. Fastest variant.}
\item{tiebreaker_depth = 2}{Apply head-to-head and division win percentage tiebreakers.}
\item{tiebreaker_depth = 3}{Apply all tiebreakers through strength of schedule.}
}}

\item{.debug}{Either \code{TRUE} or \code{FALSE}. Controls if additional
messages are printed to the console showing what the tiebreaking algorithms
are currently performing.}

\item{playoff_seeds}{Number of playoff seeds within a conference (increased
in 2020 from 6 to 7).}
}
\value{
A data frame of division standings including playoff seeds and the
week in which the season ended for the respective team (\code{exit}).
}
\description{
Compute NFL Playoff Seedings using Game Results and Divisional Rankings
}
\examples{
\donttest{
 options(digits = 3)
 options(tibble.print_min = 64)
 library(dplyr)

 readRDS(url("https://github.com/leesharpe/nfldata/blob/master/data/games.rds?raw=true")) \%>\%
   dplyr::filter(season \%in\% 2019:2020) \%>\%
   dplyr::select(sim = season, game_type, week, away_team, home_team, result) \%>\%
   compute_division_ranks() \%>\%
   compute_conference_seeds(h2h = .$h2h)
}
}