use utf8;
use encoding 'utf-8';

package 天体;

sub new {
    my $class = shift;
    my $self = {};
    return bless $self, $class;
}

sub メソッド{
    print '天体のメソッド';
}

$天体 = new 天体();
$天体->メソッド();
