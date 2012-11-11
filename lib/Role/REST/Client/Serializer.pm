package Role::REST::Client::Serializer;
{
  $Role::REST::Client::Serializer::VERSION = '0.13';
}

use Try::Tiny;
use Moose;
use Moose::Util::TypeConstraints;

use Data::Serializer::Raw;

has 'type' => (
    isa => enum ([qw{application/json application/xml application/yaml application/x-www-form-urlencoded}]),
    is  => 'rw',
	default => 'application/json',
);
no Moose::Util::TypeConstraints;
has 'serializer' => (
	isa => 'Data::Serializer::Raw',
	is => 'ro',
	default => \&_set_serializer,
	lazy => 1,
);

no Moose;

our %modules = (
	'application/json' => {
		module => 'JSON',
	},
	'application/xml' => {
		module => 'XML::Simple',
	},
	'application/yaml' => {
		module => 'YAML',
	},
	'application/x-www-form-urlencoded' => {
		module => 'FORM',
	},
);

sub _set_serializer {
	my $self = shift;
	return unless $modules{$self->type};

	my $module = $modules{$self->type}{module};
	return $module if $module eq 'FORM';

	return Data::Serializer::Raw->new(
		serializer => $module,
	);
}

sub content_type {
	my ($self) = @_;
	return $self->type;
}

sub serialize {
	my ($self, $data) = @_;
	return unless $self->serializer;

	my $result;
	try {
		$result = $self->serializer->serialize($data)
	} catch {
		warn "Couldn't serialize data with " . $self->type;
	};

	return $result;
}

sub deserialize {
	my ($self, $data) = @_;
	return unless $self->serializer;

	my $result;
	try {
		$result = $self->serializer->deserialize($data);
	} catch {
		warn "Couldn't deserialize data with " . $self->type;
	};

	return $result;
}

1;

__END__
=pod

=head1 NAME

Role::REST::Client::Serializer

=head1 VERSION

version 0.13

=head1 AUTHOR

Kaare Rasmussen <kaare at cpan dot net>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Kaare Rasmussen.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

