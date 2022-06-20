package api

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func (server *Server) home(ctx *gin.Context) {
	ctx.JSON(http.StatusOK, "Welcome in home page."+ctx.Request.RequestURI)
}
