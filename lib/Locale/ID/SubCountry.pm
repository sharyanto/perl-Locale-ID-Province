package Locale::ID::SubCountry;
use Locale::ID::Province;

# AUTHORITY
# DATE
# DIST
# VERSION

our @ISA       = @Locale::ID::Province::ISA;
our @EXPORT    = @Locale::ID::Province::EXPORT;
our @EXPORT_OK = @Locale::ID::Province::EXPORT_OK;
our %SPEC      = %Locale::ID::Province::SPEC;
for my $f (keys %SPEC) {
    *{$f} = \&{"Locale::ID::Province::$f"};
}

1;
# ABSTRACT: Alias for Locale::ID::Province
