package MooseX::HasDefaults::Meta::IsRO;
use Moose::Role;

# This does not actually do anything but lie less in the attribute's metadata.
has '+is' => (
    default => 'ro',
);

around _process_options => sub {
    my $orig = shift;
    my (undef, undef, $options) = @_;

    if (!exists($options->{is})) {
        $options->{is} = 'ro';
    }
    # They want no accessor, but Moose doesn't like "is => undef"
    elsif (!defined($options->{is})) {
        delete $options->{is};
    }

    $orig->(@_);
};

1;

