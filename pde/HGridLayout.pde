public static class HGridLayout implements HLayout {
	protected int _currentIndex, _numCols;
	protected float _startX, _startY, _xSpace, _ySpace;
	public HGridLayout() {
		_xSpace = _ySpace = _numCols = 16;
	}
	public HGridLayout(int numOfColumns) {
		this();
		_numCols = numOfColumns;
	}
	public HGridLayout currentIndex(int i) {
		_currentIndex = i;
		return this;
	}
	public int currentIndex() {
		return _currentIndex;
	}
	public HGridLayout resetIndex() {
		_currentIndex = 0;
		return this;
	}
	public HGridLayout cols(int numOfColumns) {
		_numCols = numOfColumns;
		return this;
	}
	public int cols() {
		return _numCols;
	}
	public PVector startLoc() {
		return new PVector(_startX, _startY);
	}
	public HGridLayout startLoc(float x, float y) {
		_startX = x;
		_startY = y;
		return this;
	}
	public float startX() {
		return _startX;
	}
	public HGridLayout startX(float x) {
		_startX = x;
		return this;
	}
	public float startY() {
		return _startY;
	}
	public HGridLayout startY(float y) {
		_startY = y;
		return this;
	}
	public PVector spacing() {
		return new PVector(_xSpace, _ySpace);
	}
	public HGridLayout spacing(float xSpacing, float ySpacing) {
		_xSpace = xSpacing;
		_ySpace = ySpacing;
		return this;
	}
	public float spacingX() {
		return _xSpace;
	}
	public HGridLayout spacingX(float xSpacing) {
		_xSpace = xSpacing;
		return this;
	}
	public float spacingY() {
		return _ySpace;
	}
	public HGridLayout spacingY(float ySpacing) {
		_ySpace = ySpacing;
		return this;
	}
	public PVector getNextPoint() {
		int currentRow = H.app().floor(_currentIndex / _numCols);
		int currentCol = _currentIndex % _numCols;
		++_currentIndex;
		return new PVector(
			currentCol*_xSpace + _startX,
			currentRow*_ySpace + _startY
		);
	}
	public void applyTo(HDrawable target) {
		target.loc(getNextPoint());
	}
}
