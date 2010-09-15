use inc::Module::Install;

name            'Module-Install-AckXXX';
all_from        'lib/Module/Install/AckXXX.pm';
readme_from;
manifest_skip;
ack_xxx;

requires 'App::Ack';
requires 'Capture::Tiny';

WriteAll;
