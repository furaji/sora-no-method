use utf8;
use 5.010;

package 天体;

binmode(STDOUT, ":utf8");

sub new {
    my $class = shift;
    my $self = {};
    return bless $self, $class;
}

sub メソッド{
    say '天体のメソッド';
}

$天体 = new 天体();
$天体->メソッド();
