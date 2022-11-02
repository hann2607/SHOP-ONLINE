<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- Modal -->
<div class="modal fade ${showModal }" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle" ${styleModal }
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document" style="width: 70vw;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body"><jsp:include page="tab-layout.jsp"></jsp:include></div>
			<div class="modal-footer" style="border: none; margin-bottom: 30px;">
				
			</div>
		</div>
	</div>
</div>
