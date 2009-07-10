use inc::Module::Install;

name           'MooseX-HasDefaults';
all_from       'lib/MooseX/HasDefaults.pm';

requires       'Moose';

build_requires 'Test::Exception';

WriteAll;

