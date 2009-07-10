package MooseX::HasDefaults::RW;
use Moose ();
use Moose::Exporter;
use Moose::Util::MetaRole;

use MooseX::HasDefaults::Meta::IsRW;

Moose::Exporter->setup_import_methods(also => 'Moose');

sub init_meta {
    shift;
    my %options = @_;

    Moose->init_meta(%options);

    Moose::Util::MetaRole::apply_metaclass_roles(
        for_class                 => $options{for_class},
        attribute_metaclass_roles => ['MooseX::HasDefaults::Meta::IsRW'],
    );

    return $options{for_class}->meta;
}

1;

