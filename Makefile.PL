
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "REST Client Role",
  "AUTHOR" => "Kaare Rasmussen <kaare at cpan dot net>",
  "BUILD_REQUIRES" => {
    "Module::Build" => "0.3601"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "DISTNAME" => "Role-REST-Client",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Role::REST::Client",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Data::Serializer::Raw" => 0,
    "HTTP::Headers" => 0,
    "HTTP::Message" => 0,
    "HTTP::Response" => 0,
    "HTTP::Status" => 0,
    "HTTP::Thin" => 0,
    "HTTP::Tiny" => 0,
    "Moo" => "1.003000",
    "Moo::Role" => 0,
    "MooX::HandlesVia" => "0.001004",
    "Try::Tiny" => 0,
    "Type::Tiny" => "0.024",
    "Types::Standard" => 0,
    "URI::Escape" => 0,
    "URI::Escape::XS" => 0
  },
  "TEST_REQUIRES" => {
    "Data::Serializer::JSON" => 0,
    "Data::Serializer::XML::Simple" => 0,
    "Data::Serializer::YAML" => 0,
    "File::Find" => 0,
    "File::Temp" => 0,
    "HTTP::Request" => 0,
    "HTTP::Thin" => 0,
    "JSON" => "2.00",
    "Moose" => 0,
    "Test::Deep" => 0,
    "Test::More" => "0.88",
    "XML::Simple" => 0,
    "YAML" => 0,
    "strict" => 0,
    "utf8" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.16",
  "test" => {
    "TESTS" => "t/*.t"
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



