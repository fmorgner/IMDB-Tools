#!/usr/bin/perl

use IMDB::Film;
use List::MoreUtils qw(uniq);

my $seriesURL = $ARGV[0];
my $sizeOfArray;
my $countOfRanLoops;
my $episodeData = undef;

# Arrays holding the information about an episode
my @castOfEpisode;
my @directorsOfEpisode;
my @writersOfEpisode;

# Reduce the URL to the IMDB ID of the series
$seriesURL =~ s/.*tt[0]*([0-9]*)\/$/$1/;

# Fetch the list of episodes contained in the series
my $seriesData       = new IMDB::Film(crit => $seriesURL);
my @episodesOfSeries = @{$seriesData->episodes};

sub printCastOfEpisode
  {
  if($episodeData == undef)
    {
    $episodeData = new IMDB::Film(crit => $_[0]);
    }

  @castOfEpisode      = @{$episodeData->cast};
  $countOfRanLoops    = 1;
  $sizeOfArray        = @castOfEpisode;

  for my $hashReference (@castOfEpisode)
    {
    if($countOfRanLoops < $sizeOfArray)
      {
      print $$hashReference{name}.", ";
      }
    else
      {
      print $$hashReference{name}."\n";      
      }

    $countOfRanLoops++;
    }
  }

sub printDirectorsOfEpisode
  {

  if($episodeData == undef)
    {
    $episodeData = new IMDB::Film(crit => $_[0]);
    }

  @directorsOfEpisode = @{$episodeData->directors};
  $countOfRanLoops    = 1;
  $sizeOfArray        = @directorsOfEpisode;
  
  for my $hashReference (@directorsOfEpisode)
    {
    if($countOfRanLoops < $sizeOfArray)
      {
      print $$hashReference{name}.", ";
      }
    else
      {
      print $$hashReference{name}."\n";
      }

    $countOfRanLoops++;
    }
  }

sub printWritersOfEpisode
  {
  if($episodeData == undef)
    {
    $episodeData = new IMDB::Film(crit => $_[0]);
    }

  @writersOfEpisode   = @{$episodeData->writers};
  $countOfRanLoops = 1;
  $sizeOfArray        = @writersOfEpisode;

  print @writersOfEpisode;  
  
  for my $hashReference (@writersOfEpisode)
    {
    if($countOfRanLoops < $sizeOfArray)
      {
      print $$hashReference{name}.", ";
      }
    else
      {
      print $$hashReference{name}."\n";
      }

    $countOfRanLoops++;
    }
  }

for my $hashReference (@episodesOfSeries)
  {
    print "\n----------\n";
    print "Episode Nr.: " . $$hashReference{episode}."\n";
    print "Season Nr.: " . $$hashReference{season}."\n";
    print "Cast: "; &printCastOfEpisode($$hashReference{id});
    print "Director(s): "; &printDirectorsOfEpisode($$hashReference{id});
    print "Writer(s): "; &printWritersOfEpisode($$hashReference{id});
    $episodeData = undef;
  }

exit(0);