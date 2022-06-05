package Task1_b::Model::Phone_book;
use Moose;
use namespace::autoclean;
use My::Namespace::Schema;

extends 'Catalyst::Model';

my $schema = My::Namespace::Schema->connect('dbi:mysql:phone_book:localhost', 'root', 'root', {
    quote_names => 1,
    mysql_enable_utf8 => 1,
});

sub add_contact {
    my ($self, $name, $surname, $phone) = @_;

    if($name eq '') { return 0 }
    if($surname eq '') { return 0 }
    if($phone eq '') { return 0 }

    $schema->resultset('Contact')->create({
        name => $name,
        surname => $surname,
        phone => $phone,
    });
}

sub show_contact {
    my $result = $schema->resultset('Contact')->search();

    return $result;
}

sub change_contact {
    my ($self, $id, $name, $surname, $phone) = @_;

    my $contact = $schema->resultset('Contact')->find($id);

    unless($contact) { return 0 }
    if($name eq '') { return 0 }
    if($surname eq '') { return 0 }
    if($phone eq '') { return 0 }

    $contact->name($name);
    $contact->surname($surname);
    $contact->phone($phone);

    $contact->update;
}

sub delete_contact {
    my ($self, $id) = @_;

    my $contact = $schema->resultset('Contact')->search({ contactID => $id });
    unless($contact) { return 0 }
    $contact->delete;
}

=head1 NAME

Task1_b::Model::Phone_book - Catalyst Model

=head1 DESCRIPTION

Catalyst Model.


=encoding utf8

=head1 AUTHOR

tr0th,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
