use inc::Module::Install;

name           'MooseX-HasDefaults';
all_from       'lib/MooseX/HasDefaults.pm';
repository     'gitmo@git.moose.perl.org:MooseX-HasDefaults.git';

requires       'Moose';

build_requires 'Test::Exception';

WriteAll;

