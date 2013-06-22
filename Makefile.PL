
use strict;
use warnings;

use 5.008;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Organise your Moose types in libraries",
  "AUTHOR" => "Robert \"phaylon\" Sedlacek <rs\@474.at>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "MooseX-Types",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "MooseX::Types",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Carp::Clan" => "6.00",
    "Class::MOP" => 0,
    "Exporter" => 0,
    "Moose" => "1.06",
    "Moose::Exporter" => 0,
    "Moose::Meta::TypeConstraint::Union" => 0,
    "Moose::Util::TypeConstraints" => 0,
    "Scalar::Util" => "1.19",
    "Sub::Exporter" => 0,
    "Sub::Install" => "0.924",
    "Sub::Name" => 0,
    "base" => 0,
    "namespace::clean" => "0.19",
    "overload" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "File::Find" => 0,
    "File::Temp" => 0,
    "FindBin" => 0,
    "Moose::Role" => 0,
    "Test::CheckDeps" => "0.002",
    "Test::Fatal" => 0,
    "Test::More" => "0.94",
    "Test::Requires" => 0,
    "lib" => 0
  },
  "VERSION" => "0.36",
  "test" => {
    "TESTS" => "t/*.t t/regressions/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



