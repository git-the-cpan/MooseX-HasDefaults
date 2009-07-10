package MooseX::HasDefaults::Meta::IsRW;
use Moose::Role;

# This does not actually do anything but lie less in the attribute's metadata.
has '+is' => (
    default => 'rw',
);

around _process_options => sub {
    my $orig = shift;
    my (undef, undef, $options) = @_;

    if (!exists($options->{is})) {
        $options->{is} = 'rw';
    }
    # They want no accessor, but Moose doesn't like "is => undef"
    elsif (!defined($options->{is})) {
        delete $options->{is};
    }

    $orig->(@_);
};

1;

