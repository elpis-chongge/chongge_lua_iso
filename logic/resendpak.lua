local ResendPak = {
  isReconnect = false,
  connectTime = nil,
  connectNeedTime = 5,
  retryNum = 1
}

function ResendPak.Resend()
  local MsgWaiterObj = require("MsgWaiter")
  MsgWaiterObj.ResendAllTimeoutMsg()
end

function ResendPak.DoReconnect()
  if ResendPak.isReconnect == true then
    return
  end
  ResendPak.isReconnect = true
  ResendPak.StartConnectGate()
end

function ResendPak.Reset()
  ResendPak.isReconnect = false
  ResendPak.ClearTime()
end

function ResendPak.StartConnectGate()
  local MsgWaiterObj = require("MsgWaiter")
  MsgWaiterObj.ShowWaitingWindow()
  Net.ReConnect()
end

function ResendPak.ClearTime()
  if ResendPak.connectTime ~= nil then
    ResendPak.connectTime:stop()
    ResendPak.connectTime = nil
  end
end

function ResendPak.ConnectServerOk()
  local MsgWaiterObj = require("MsgWaiter")
  MsgWaiterObj.Destroy()
  MsgWaiterObj.HideWaitingWindow()
  ResendPak.Reset()
end

return ResendPak
