
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Data::Serializer::JSON" => 0,
    "Data::Serializer::Raw" => 0,
    "Data::Serializer::XML::Simple" => 0,
    "Data::Serializer::YAML" => 0,
    "File::Find" => 0,
    "File::Temp" => 0,
    "HTTP::Message" => 0,
    "JSON" => "2.00",
    "Module::Build" => "0.3601",
    "MooseX::Declare" => 0,
    "Test::Deep" => 0,
    "Test::More" => "0.88",
    "XML::Simple" => 0,
    "YAML" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "configure_requires" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "REST Client Role",
  "dist_author" => [
    "Kaare Rasmussen <kaare at cpan dot net>"
  ],
  "dist_name" => "Role-REST-Client",
  "dist_version" => "0.11",
  "license" => "perl",
  "module_name" => "Role::REST::Client",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Carp" => 0,
    "Data::Serializer::Raw" => 0,
    "HTTP::Headers" => 0,
    "HTTP::Response" => 0,
    "HTTP::Status" => 0,
    "HTTP::Tiny" => 0,
    "Moose" => 0,
    "Moose::Role" => 0,
    "Moose::Util::TypeConstraints" => 0,
    "MooseX::Traits" => 0,
    "Try::Tiny" => 0,
    "URI::Escape" => 0
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
