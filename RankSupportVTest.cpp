#include "sdsl/int_vector.hpp"
#include "sdsl/rank_support_v.hpp"
#include "sdsl/bitmagic.hpp"
#include "gtest/gtest.h"
#include <vector>
#include <cstdlib> // for rand()

namespace {

typedef sdsl::int_vector<>::size_type size_type;	

class RankSupportTest : public ::testing::Test {
	protected:

	static const size_t n = 20;	

	RankSupportTest() {
		// You can do set-up work for each test here
	}	

	virtual ~RankSupportTest() {
		// You can do clean-up work that doesn't throw exceptions here.
	}

	// If the constructor and destructor are not enough for setting up
	// and cleaning up each test, you can define the following methods:
	virtual void SetUp() {
	   // Code here will be called immediately after the constructor (right
	   // before each test).
	   for(size_type i=0; i<n; ++i){
	     bs[i] = sdsl::bit_vector(rand() % (8<<i));
		 for(size_type j=0; j < bs[i].size(); ++j){
		   if( rand() % 2 )
			   bs[i][j] = 1;
		 }
	   }
	}

	virtual void TearDown() {
		// Code here will be called immediately after each test (right
		// before the destructor).
	}

	// Objects declared here can be used by all tests in the test case for Foo.
	sdsl::bit_vector bs[n];
};

//! Test the default constructor
TEST_F(RankSupportTest, DefaultConstruct) {
	for(size_type i=0; i<RankSupportTest::n; ++i)
	{ 
		sdsl::rank_support_v<> rs( &bs[i] );

		sdsl::rank_support_v<> rs2;
		{
			sdsl::rank_support_v<> tmp( &bs[i] );
			rs2.swap( tmp );
			rs2.set_vector( &bs[i] );
		}
		for(size_type j=0, rank=0; j < bs[i].size(); ++j){
			ASSERT_EQ( rs.rank(j), rank );
			ASSERT_EQ( rs2.rank(j), rank );
			rank += bs[i][j];
		}
	}
}

}


int main(int argc, char **argv) {
	  ::testing::InitGoogleTest(&argc, argv);
	    return RUN_ALL_TESTS();
}

