package Task1_b::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=encoding utf-8

=head1 NAME

Task1_b::Controller::Root - Root Controller for Task1_b

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=cut


=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    # Hello World
    # $c->response->body( $c->welcome_message );
    $c->res->redirect('/phone_book');
}

sub phone_book :Local {
	my ($self, $c) = @ _;
	
	$c->stash(
		template => 'index.tt',
	);
}

sub add_contact :Path('phone_book/add_contact') {
    my ($self, $c) = @_;

    my $name = $c->req->body_params->{name};
    my $surname = $c->req->body_params->{surname};
    my $phone = $c->req->body_params->{phone};

    $c->model('Phone_book')->add_contact($name, $surname, $phone);

    $c->stash(
		template => 'add_contact.tt',
	);
}

sub change_contact :Path('phone_book/change_contact') {
    my ($self, $c) = @_;

    my $id = $c->req->body_params->{id};
    my $name = $c->req->body_params->{name};
    my $surname = $c->req->body_params->{surname};
    my $phone = $c->req->body_params->{phone};

    $c->model('Phone_book')->change_contact($id, $name, $surname, $phone);

    $c->stash(
        template => 'change_contact.tt',
    );
}

sub delete_contact :Path('phone_book/delete_contact') {
    my ($self, $c) = @_;

    my $id = $c->req->body_params->{id};

    $c->model('Phone_book')->delete_contact($id);

    $c->stash(
        template => 'delete_contact.tt',
    );
}

sub show_contacts :Path('phone_book/show_contacts') {
    my ($self, $c) = @_;

    $c->stash(
        contacts => $c->model('Phone_book')->show_contact(),
        template => 'show_contacts.tt',
    );
}

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

tr0th,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
