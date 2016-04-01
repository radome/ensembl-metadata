=head1 LICENSE

Copyright [2009-2016] EMBL-European Bioinformatics Institute

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=head1 CONTACT

  Please email comments or questions to the public Ensembl
  developers list at <dev@ensembl.org>.

  Questions may also be sent to the Ensembl help desk at
  <helpdesk@ensembl.org>.
  
=head1 NAME

Bio::EnsEMBL::MetaData::DBAFinder

=head1 SYNOPSIS

=head1 DESCRIPTION

Base class for retrieving lists of DBAs to retrieve metadata from

=head1 AUTHOR

Dan Staines

=cut


package Bio::EnsEMBL::MetaData::DBAFinder;
use Bio::EnsEMBL::Utils::Exception qw/throw/;
use strict;
use warnings;

=head1 SUBROUTINES/METHODS
=head2 new
Description : Create a new object
Returntype  : Bio::EnsEMBL::MetaData::DBAFinder
=cut

sub new {
  my $caller = shift;
  my $class  = ref($caller) || $caller;
  my $self   = bless({}, $class);
  return $self;
}

=head2 get_dbas
  Description: Find DBAs to work on (stub method)
  Returntype : Arrayref of Bio::EnsEMBL::DBSQL::DBAdaptor
  Exceptions : none
  Caller     : general
  Status     : Stable
=cut
sub get_dbas {
  my ($self) = @_;
  throw "Unimplemented subroutine get_dbas() in " .
	ref($self) . ". Please implement";
}

1;
