package semi.beans;

public class GenreDto {
	
	private Long genreNo;
	private String genreName;
	private Long genreParents;
	
	public GenreDto() {
		super();
	}
	public Long getGenreNo() {
		return genreNo;
	}
	public void setGenreNo(Long genreNo) {
		this.genreNo = genreNo;
	}
	public String getGenreName() {
		return genreName;
	}
	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}
	public Long getGenreParents() {
		return genreParents;
	}
	public void setGenreParents(Long genreParents) {
		this.genreParents = genreParents;
	}
	
	

}
