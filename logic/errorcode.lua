local ErrorCode = {}

function ErrorCode.DealError(errorCode)
  local RET_CODE = ProtoEnum.RET_CODE
  if errorCode == RET_CODE.RC_TOKEN_INVALID or errorCode == RET_CODE.RC_TOKEN_EXPIRE or errorCode == RET_CODE.RC_TOKEN_NOT_AUTHED or errorCode == RET_CODE.RC_TOKEN_ILLEGAL then
    LoginMgr.ConnectSDKAuth()
  end
end

return ErrorCode
