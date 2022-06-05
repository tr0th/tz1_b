use utf8;
package My::Namespace::Schema::Result::Contact;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

My::Namespace::Schema::Result::Contact

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<contacts>

=cut

__PACKAGE__->table("contacts");

=head1 ACCESSORS

=head2 contactid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 20

=head2 surname

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 phone

  data_type: 'varchar'
  is_nullable: 1
  size: 13

=cut

__PACKAGE__->add_columns(
  "contactid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 20 },
  "surname",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "phone",
  { data_type => "varchar", is_nullable => 1, size => 13 },
);

=head1 PRIMARY KEY

=over 4

=item * L</contactid>

=back

=cut

__PACKAGE__->set_primary_key("contactid");


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2022-06-04 19:02:18
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:fUB1UEbe6m3c6jUmyK/RqQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
