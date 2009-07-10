package MooseX::HasDefaults::RO;
use Moose ();
use Moose::Exporter;
use Moose::Util::MetaRole;

use MooseX::HasDefaults::Meta::IsRO;

Moose::Exporter->setup_import_methods(also => 'Moose');

sub init_meta {
    shift;
    my %options = @_;

    Moose->init_meta(%options);

    Moose::Util::MetaRole::apply_metaclass_roles(
        for_class                 => $options{for_class},
        attribute_metaclass_roles => ['MooseX::HasDefaults::Meta::IsRO'],
    );

    return $options{for_class}->meta;
}

1;

