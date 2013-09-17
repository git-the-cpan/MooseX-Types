use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::NoTabsTests 0.02

use Test::More 0.88;
use Test::NoTabs;

my @files = (
    'lib/MooseX/Types.pm',
    'lib/MooseX/Types/Base.pm',
    'lib/MooseX/Types/CheckedUtilExports.pm',
    'lib/MooseX/Types/Combine.pm',
    'lib/MooseX/Types/Moose.pm',
    'lib/MooseX/Types/TypeDecorator.pm',
    'lib/MooseX/Types/UndefinedType.pm',
    'lib/MooseX/Types/Util.pm',
    'lib/MooseX/Types/Wrapper.pm'
);

notabs_ok($_) foreach @files;
done_testing;
