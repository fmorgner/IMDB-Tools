#!/usr/bin/perl

use IMDB::Film;
use HTTP::Request;
use LWP::UserAgent;

my $filmURL = $ARGV[0];
my $sizeOfArray;
my $countOfRanLoops;

# Arrays holding the information about a Film
my @castOfFilm;
my @directorsOfFilm;
my @writersOfFilm;

$filmURL =~ s/.*tt[0]*([0-9]*)\/$/$1/;
my $filmData = new IMDB::Film(crit => $filmURL);

sub printCastOfFilm
  {
  @castOfFilm = @{$filmData->cast};
  $countOfRanLoops = 1;
  $sizeOfArray = @castOfFilm;

  for my $hashReference (@castOfFilm)
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

sub printDirectorsOfFilm
  {
  @directorsOfFilm = @{$filmData->directors};
  $countOfRanLoops = 1;
  $sizeOfArray = @directorsOfFilm;
  
  for my $hashReference (@directorsOfFilm)
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

sub printWritersOfFilm
  {
  @writersOfFilm = @{$filmData->writers};
  $countOfRanLoops = 1;
  $sizeOfArray = @writersOfFilm;
  
  for my $hashReference (@writersOfFilm)
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

print "Cast: "; &printCastOfFilm;
print "Director(s): "; &printDirectorsOfFilm;
print "Writer(s): "; &printWritersOfFilm;

exit(0);