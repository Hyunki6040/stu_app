package poly.persistance.mapper;



import java.util.List;

import config.Mapper;
import poly.dto.BoardDTO;
import poly.dto.CommentDTO;

@Mapper("CommentMapper")
public interface CommentMapper {
	public List<CommentDTO> CommentsList() throws Exception;
	public List<CommentDTO> CampusCommentsList(BoardDTO mDTO) throws Exception;
	
	public int insert(CommentDTO cDTO) throws Exception;
	
	public CommentDTO getComment(int bno) throws Exception;
	public int updateLikedComment(CommentDTO bDTO) throws Exception;
	public int updateHatredComment(CommentDTO bDTO) throws Exception;
	
	public int CommentDelete(CommentDTO bDTO) throws Exception;
}
