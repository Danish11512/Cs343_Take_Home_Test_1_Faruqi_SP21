void leaf_example() {
	static int f = 0;
	static int g = 50;
	static int h = 40;
	static int i = 30;
	static int j = 20;

	f = (g + h) - (i + j);


}
int main() {
	leaf_example();

	return 0;
}