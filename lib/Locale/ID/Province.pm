package Locale::ID::Province;

use 5.010;
use strict;
use warnings;
use Sub::Spec::Gen::ReadTable qw(gen_read_table_func);

use Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(
                       list_id_provinces
               );

our %SPEC;

# BEGIN IMPORT DATA
# src: /home/s1/proj/gdint/data/ind_province/data.csv
# revision: e1a96f6
# date: Wed Dec 14 12:21:04 2011 +0700
# imported-by: /home/s1/bin/csv2perl
my $data = [
    ['11','ID-AC','Aceh','Aceh','Banda Aceh','Sumatera','["special territory"]'],
    ['12','ID-SU','Sumatera Utara','North Sumatra','Medan','Sumatera',''],
    ['13','ID-SB','Sumatera Barat','West Sumatra','Padang','Sumatera',''],
    ['14','ID-RI','Riau','Riau','Pekanbaru','Sumatera',''],
    ['15','ID-JA','Jambi','Jambi','Jambi','Sumatera',''],
    ['16','ID-SS','Sumatera Selatan','South Sumatra','Palembang','Sumatera',''],
    ['17','ID-BE','Bengkulu','Bengkulu','Bengkulu','Sumatera',''],
    ['18','ID-LA','Lampung','Lampung','Bandar Lampung','Sumatera',''],
    ['19','ID-BB','Kepulauan Bangka Belitung','Bangka Belitung Islands','Pangkal Pinang','Sumatera',''],
    ['21','ID-KR','Kepulauan Riau','Riau Islands','Tanjung Pinang','Sumatera',''],
    ['31','ID-JK','Daerah Khusus Ibukota Jakarta','Jakarta Special Capital Territory','Jakarta Pusat','Jawa','["special territory", "special capital territory", "capital"]'],
    ['32','ID-JB','Jawa Barat','West Java','Bandung','Jawa',''],
    ['33','ID-JT','Jawa Tengah','Central Java','Semarang','Jawa',''],
    ['34','ID-YO','Daerah Istimewa Yogyakarta','Yogyakarta Special Territory','Yogyakarta','Jawa','["special territory"]'],
    ['35','ID-JI','Jawa Timur','East Java','Surabaya','Jawa',''],
    ['36','ID-BT','Banten','Banten','Serang','Jawa',''],
    ['51','ID-BA','Bali','Bali','Denpasar','Bali',''],
    ['52','ID-NB','Nusa Tenggara Barat','West Nusa Tenggara','Mataram','Nusa Tenggara',''],
    ['53','ID-NT','Nusa Tenggara Timur','East Nusa Tenggara','Kupang','Nusa Tenggara',''],
    ['61','ID-KB','Kalimantan Barat','West Kalimantan','Pontianak','Kalimantan',''],
    ['62','ID-KT','Kalimantan Tengah','Central Kalimantan','Palangkaraya','Kalimantan',''],
    ['63','ID-KS','Kalimantan Selatan','South Kalimantan','Banjarmasin','Kalimantan',''],
    ['64','ID-KI','Kalimantan Timur','East Kalimantan','Samarinda','Kalimantan',''],
    ['71','ID-SA','Sulawesi Utara','North Sulawesi','Manado','Sulawesi',''],
    ['72','ID-ST','Sulawesi Tengah','Central Sulawesi','Palu','Sulawesi',''],
    ['73','ID-SN','Sulawesi Selatan','South Sulawesi','Makassar','Sulawesi',''],
    ['74','ID-SG','Sulawesi Tenggara','South East Sulawesi','Kendari','Sulawesi',''],
    ['75','ID-GO','Gorontalo','Gorontalo','Gorontalo','Sulawesi',''],
    ['76','ID-SR','Sulawesi Barat','West Sulawesi','Mamuju','Sulawesi',''],
    ['81','ID-MA','Maluku','Maluku','Ambon','Maluku',''],
    ['82','ID-MU','Maluku Utara','North Maluku','Sofifi','Maluku',''],
    ['91','ID-PB','Papua Barat','West Papua','Manokwari','Papua','["special territory"]'],
    ['94','ID-PA','Papua','Papua','Jayapura','Papua','["special territory"]'],
];
# END IMPORT DATA

# BEGIN IMPORT META
# src: /home/s1/proj/gdint/data/ind_province/meta.yaml
# revision: 071860a
# date: Wed Dec 14 11:11:24 2011 +0700
# imported-by: /home/s1/bin/yaml2dd
my $meta = {
  "columns" => {
    bps_code => [
      "int*",
      {
        "column_index"    => 0,
        "column_sortable" => 1,
        "column_unique"   => 1,
        "summary"         => "BPS code",
        "summary:ind"     => "Kode BPS",
      },
    ],
    eng_name => [
      "str*",
      {
        "column_index"    => 3,
        "column_sortable" => 1,
        "column_unique"   => 1,
        "summary"         => "Name (in English)",
        "summary:ind"     => "Nama (bahasa Inggris)",
      },
    ],
    ind_capital_name => [
      "str*",
      {
        "_note"           => "TODO link to locality_id",
        "column_index"    => 4,
        "column_sortable" => 1,
        "summary"         => "Capital name (Indonesian)",
        "summary:ind"     => "Nama ibukota (bahasa Indonesia)",
      },
    ],
    ind_island_name => [
      "str*",
      {
        "_note"        => "TODO link to island_id",
        "arg_pos"      => 7,
        "column_index" => 5,
        "ind_summary"  => "Pulau",
        "summary"      => "Island (Indonesian)",
        "summary:ind"  => "Pulau",
      },
    ],
    ind_name => [
      "str*",
      {
        "column_index"    => 2,
        "column_sortable" => 1,
        "column_unique"   => 1,
        "summary"         => "Name (in Indonesian)",
        "summary:ind"     => "Nama (bahasa Indonesia)",
      },
    ],
    iso3166_2_code => [
      "str*",
      {
        "column_index"    => 1,
        "column_sortable" => 1,
        "column_unique"   => 1,
        "match"           => "^[A-Z]{2}-[A-Z]{2}\$",
        "summary"         => "ISO 3166-2 code",
        "summary:ind"     => "Kode ISO 3166-2",
      },
    ],
    tags => [
      "str*",
      { "column_index" => 6, "summary:ind" => "Tag (bahasa Inggris)" },
    ],
  },
  "pk" => "ind_name",
  "summary" => "Provinces in Indonesia",
  "summary:ind" => "Provinsi di Indonesia",
  "table_aliases:ind" => ["provinsi_ind"],
};
# END IMPORT META

my $res = gen_read_table_func(
    table_data => $data,
    table_spec => $meta,
);

die "BUG: Can't generate func: $res->[0] - $res->[1]"
    unless $res->[0] == 200;

my $spec = $res->[2]{spec};
$SPEC{list_id_provinces} = $spec;
no warnings;
*list_id_provinces = $res->[2]{code};
use warnings;

1;
__END__
# ABSTRACT: List of provinces in Indonesia

=head1 SYNOPSIS

 use Locale::ID::Province qw(list_id_provinces);
 my $res = list_id_provinces();


=head1 DESCRIPTION

This module provides API access for list of provinces in Indonesia. Data is
currently retrieved from the B<gudang-data-interim> repository at
https://github.com/sharyanto/gudang-data-interim/tree/master/data/ind_province/

This module's functions has L<Sub::Spec> specs.


=head1 FUNCTIONS

None are exported by default, but they are exportable.


=head1 SEE ALSO

L<list-id-provinces>

Gudang Data Interim project, https://github.com/sharyanto/gudang-data-interim/

This API will also be available on GudangAPI, http://gudangapi.com/

=cut
