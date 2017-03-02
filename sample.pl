use utf8;
use strict;
use warnings;

use CBitcoin;
use CBitcoin::Tree;
use CBitcoin::Tree::Broadcast;
use CBitcoin::CBHD;
use CBitcoin::TransactionInput;
use CBitcoin::TransactionOutput;
use CBitcoin::Transaction;
use CBitcoin::BloomFilter;



$CBitcoin::network_bytes = CBitcoin::TESTNET;

my $xprv = CBitcoin::CBHD->generate();
print "Back me up: ".$xprv->export_xprv()."\n";
my $tree = CBitcoin::Tree->new( 
        ["ROOT/CHANNEL","ROOT/SERVERS","ROOT/CASH"]
        ,{'base directory' => $ENV{'HOME'}.'/.db1', 'id' => 'wallet'}
);

my $tx = $tree->cash_move("ROOT/CASH","ROOT/CHANNEL",10102039);

my $txdata = '......................put tx data here..............';
$tree->tx_add(time(),$txdata);



# hotel room id= 504 
my $customer_type = pack('C',1); # 1 means guest staying at hotel, 2 means renting a car, etc..
my $customerID = 'cefbed79-3586-4b16-82e7-03aa2425ae9e';
my $hotelroom = pack('L',504);
my %rights = ('ROOM' => 1, 'TV' => 2, 'POOL' => 4, 'BREAKFAST' => 8);
my $rightsbits = pack('S',$rights{'ROOM'} | $rights{'TV'} | $rights{'BREAKFAST'});

# change customer id to binary
$customerID =~ s/\-//g;
$customerID = lc($customerID);
$customerID = pack('H*',$customerID);

my $broadcast_msg = $customer_type.$customerID.$hotelroom.$rightsbits;

# to receive broadcast, add callback
my $broadcast_txdata = $tree->spend("ROOT/CHANNEL",CBitcoin::TransactionOutput->new({
	'value' => 0
	,'script' => "OP_RETURN 0x".unpack('H*',$broadcast_msg)
}));
print "Send me: ".unpack('H*',$broadcast_txdata)."\n";



# TODO: make this work!
my $m1 = '';
$node->broadcast_callback(sub{
	my ($this,$message) = @_;
	print "Got Message:$message\n";
});


